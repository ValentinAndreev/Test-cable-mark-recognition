# Тестовое задание парсинг/распознавание параметров кабелей.  

Сделано в виде гема.  
Установка:  
gem 'recognition', git: 'https://github.com/ValentinAndreev/Test-cable-mark-recognition.git'  

Использование:  
require 'recognition'  
Recognition::Parser.new.parse_file(file, path_to_data)  
file - распознаваемый файл (по умолчанию берется тестовый файл заявка.csv)  
path_to_data - путь к yaml файлу в котором перечислены марки, исполнения и цвета в формате:  
<pre>
mark:  
  ПЭТД  
execution:  
  ХЛ  
colors:  
  зеленый  
  желтый  
</pre>
По умолчанию - берется пример из гема.  

Результат - массив хэшей (показано выполнение на тестовой заявка.csv):  
[{"mark"=>nil}, {"mark"=>"ПЭТД-180", "voltage"=>nil, "execution"=>nil, "standard"=>nil, "size"=>"1x0,28", "colors"=>nil}, {"mark"=>"ПЭТВ-2", "voltage"=>nil, "execution"=>nil, "standard"=>"ТУ 16-705-110-79", "size"=>"0,950", "colors"=>nil}, {"mark"=>"ПуГВ", "voltage"=>nil, "execution"=>nil, "standard"=>"ТУ 16-705.501-2010", "size"=>"1х6", "colors"=>["зеленый", "желтый"]}, {"mark"=>"АПБ", "voltage"=>nil, "execution"=>nil, "standard"=>nil, "size"=>"5,20х12,50/0,45", "colors"=>nil}, {"mark"=>"ПуГВ", "voltage"=>nil, "execution"=>"ХЛ", "standard"=>nil, "size"=>"2х16", "colors"=>nil}]  

mark - марка, voltage - напряжение (массив из 2-х элементов: значение и единица измерения), execution - исполнение, standart - ТУ или ГОСТ, size - размер, colors - массив из значений цветов.  
