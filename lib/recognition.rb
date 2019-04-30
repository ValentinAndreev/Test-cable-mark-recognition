# frozen_string_literal: true

require 'bundler/setup'
require 'yaml/store'

Bundler.require

module Recognition
  class Parser
    def parse_file(file = 'test.csv', path_to_data = 'data/cable.yml')
      result = []
      File.foreach(file) do |row|
        line = {}
        line['mark'] = parse_mark(row, store(path_to_data)['mark'].split(' '))
        if line['mark']
          line['voltage'] = parse_voltage(row)
          line['execution'] = parse_execution(row, line['mark'], store(path_to_data)['execution'].split(' '))
          line['standard'] = parse_standard(row)
          line['size'] = parse_size(row, line['mark'], line['execution'])
        end
        result << [line]
      end
      result
    end

    private

    def parse_mark(row, marks)
      marks.each do |mark|
        return mark + row.scan(/#{mark}(-\d+)?/i).flatten[0].to_s if row =~ /#{mark}/i
      end
      nil
    end

    def parse_voltage(row)
      voltage = row.scan(/(\d*[,.]?\d*\s*(мкВ|мВ|В|кВ|МВ(;|.| )))/).flatten.reject { |v| v.to_f == 0 }.join
      voltage == '' ? nil : voltage.tr(';', '').tr(',', '.').split(' ')
    end

    def parse_execution(row, mark, executions)
      executions.each do |execution|
        return row.scan(/#{mark}(-| )(#{execution})/i).flatten.last if row =~ /#{mark}(-| )#{execution}/i
      end
      nil
    end

    def parse_standard(row)
      row.scan(/( |,|;)((ТУ|ГОСТ)( |-)\d+.+?)( |;)/).flatten[1]
    end

    def parse_size(row, mark, execution)
      if execution
        row.partition(mark).last.scan(/#{execution}( |-|;)(.+?)( |-|;)/).flatten[1].gsub(/\,+$/, '')
      else
        row.scan(/#{mark}( |-|;)(.+?)( |-|;)/i).flatten[1].gsub(/\,+$/, '')
      end
    end

    def store(path_to_data)
      @store ||= YAML.load_file(path_to_data)
    end
  end
end
