require 'spec_helper'
require 'stringio'
require 'tempfile'

describe LunchMoney::Configuration do
  subject(:config) { described_class.new }

  describe 'default state' do
    it 'has debugging disabled' do
      expect(config.debugging).to be false
    end

    it 'has nil log_level' do
      expect(config.log_level).to be_nil
    end

    it 'has nil log_output' do
      expect(config.log_output).to be_nil
    end

    it 'returns a silent logger by default' do
      expect(config.logger).to be_a(Logger)
      expect(config.logger.level).to be > Logger::FATAL
    end
  end

  describe '#debugging=' do
    it 'enables DEBUG level logging to STDOUT' do
      config.debugging = true
      expect(config.debugging).to be true
      expect(config.logger.level).to eq(Logger::DEBUG)
    end

    it 'returns to silent when disabled' do
      config.debugging = true
      config.debugging = false
      expect(config.logger.level).to be > Logger::FATAL
    end
  end

  describe '#log_level=' do
    it 'sets the logger to INFO level' do
      config.log_level = :info
      expect(config.logger.level).to eq(Logger::INFO)
    end

    it 'sets the logger to WARN level' do
      config.log_level = :warn
      expect(config.logger.level).to eq(Logger::WARN)
    end

    it 'sets the logger to ERROR level' do
      config.log_level = :error
      expect(config.logger.level).to eq(Logger::ERROR)
    end

    it 'sets the logger to FATAL level' do
      config.log_level = :fatal
      expect(config.logger.level).to eq(Logger::FATAL)
    end

    it 'makes debugging return true when set to :debug' do
      config.log_level = :debug
      expect(config.debugging).to be true
      expect(config.logger.level).to eq(Logger::DEBUG)
    end

    it 'raises ArgumentError for invalid levels' do
      config.log_level = :invalid
      expect { config.logger }.to raise_error(ArgumentError, /Invalid log_level/)
    end

    it 'rebuilds the logger when changed' do
      config.log_level = :info
      logger1 = config.logger
      config.log_level = :warn
      logger2 = config.logger
      expect(logger1).not_to equal(logger2)
      expect(logger2.level).to eq(Logger::WARN)
    end
  end

  describe '#log_output=' do
    it 'directs output to $stderr' do
      config.log_level = :info
      config.log_output = $stderr
      output = config.logger.instance_variable_get(:@logdev)&.dev
      expect(output).to eq($stderr)
    end

    it 'directs output to a file path' do
      tmpfile = Tempfile.new('lm_log_test')
      path = tmpfile.path
      tmpfile.close

      config.log_level = :info
      config.log_output = path
      config.logger.info('test message')

      content = File.read(path)
      expect(content).to include('test message')
    ensure
      tmpfile&.unlink
    end

    it 'rebuilds the logger when changed' do
      config.log_level = :info
      config.log_output = $stdout
      logger1 = config.logger
      config.log_output = $stderr
      logger2 = config.logger
      expect(logger1).not_to equal(logger2)
    end
  end

  describe '#logger=' do
    it 'overrides the internal logger' do
      custom = Logger.new($stderr)
      custom.level = Logger::WARN

      config.log_level = :debug
      config.logger = custom
      expect(config.logger).to equal(custom)
      expect(config.logger.level).to eq(Logger::WARN)
    end

    it 'ignores log_level and log_output when custom logger is set' do
      custom = Logger.new($stderr)
      config.log_level = :info
      config.log_output = $stdout
      config.logger = custom
      expect(config.logger).to equal(custom)
    end
  end

  describe 'backward compatibility' do
    it 'works with debugging = true like before' do
      config.debugging = true
      expect(config.logger).to be_a(Logger)
      expect(config.logger.level).to eq(Logger::DEBUG)
    end

    it 'supports the configure block pattern' do
      LunchMoney.configure do |c|
        c.log_level = :info
        c.log_output = $stderr
      end

      expect(LunchMoney::Configuration.default.log_level).to eq(:info)
      expect(LunchMoney::Configuration.default.logger.level).to eq(Logger::INFO)
    ensure
      # Reset to avoid polluting other tests
      LunchMoney.configure do |c|
        c.log_level = nil
        c.log_output = nil
      end
    end
  end
end
