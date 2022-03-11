﻿Функция ЗаполнитьСтруктуруИзОтветаJSON(Знач Чтение) Экспорт
	
	Результат = Новый Структура;

	ПоследнееИмяРеквизита = Неопределено;
	
	Пока Чтение.Прочитать() Цикл
		Тип = Чтение.ТипТекущегоЗначения;
		Если Тип = ТипЗначенияJSON.НачалоОбъекта И ПоследнееИмяРеквизита<>Неопределено Тогда 
			Результат[ПоследнееИмяРеквизита] = ЗаполнитьСтруктуруИзОтветаJSON(Чтение);
		ИначеЕсли Тип = ТипЗначенияJSON.КонецОбъекта Тогда 
			Возврат Результат;
			ПоследнееИмяРеквизита = Неопределено;
		ИначеЕсли Тип = ТипЗначенияJSON.ИмяСвойства И
			Лев(Чтение.ТекущееЗначение, 1) <> "+" И Лев(Чтение.ТекущееЗначение, 1) <> "-" Тогда
			
			Результат.Вставить(Чтение.ТекущееЗначение, Неопределено);
			ПоследнееИмяРеквизита = Чтение.ТекущееЗначение;
		ИначеЕсли (Тип = ТипЗначенияJSON.Булево или Тип = ТипЗначенияJSON.Строка
			или Тип = ТипЗначенияJSON.Число или Тип = ТипЗначенияJSON.Null) И
			Результат.Свойство(ПоследнееИмяРеквизита) Тогда
			
			Результат[ПоследнееИмяРеквизита] = Чтение.ТекущееЗначение;
		ИначеЕсли Тип = ТипЗначенияJSON.НачалоМассива Тогда 
			Результат[ПоследнееИмяРеквизита] = ЗаполнитьМассивИзОтветаJSON(Чтение);
		КонецЕсли;
	КонецЦикла;  
		
	Возврат Результат;
	
КонецФункции

Функция ЗаполнитьМассивИзОтветаJSON(Знач Чтение) Экспорт
	
	Результат = Новый Массив;
	
	Пока Чтение.Прочитать() Цикл
		Тип = Чтение.ТипТекущегоЗначения;
		Если Тип = ТипЗначенияJSON.НачалоОбъекта Тогда 
			Результат.Добавить(ЗаполнитьСтруктуруИзОтветаJSON(Чтение));
		ИначеЕсли Тип = ТипЗначенияJSON.КонецМассива Тогда 
			Возврат Результат;
		КонецЕсли;
	КонецЦикла;  
	
	Возврат Результат;
	
КонецФункции
