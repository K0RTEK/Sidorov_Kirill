library(dplyr)
library(tidyr)

# Загрузка данных
df11 <- read.csv(file = "R/Lesson3/ДЗ3_superstore_data.csv", header = TRUE, encoding = "utf-8")
print(head(df11, 3))

# Объединяем столбцы Education и Marital_Status
df11 <- df11 %>%
  unite("Combined_Column", Education, Marital_Status, sep = " ")

# Изменяем тип столбца RichFlag с boolean на numeric
df11$RichFlag <- as.numeric(df11$RichFlag)

# Проверяем и заполняем NaN значения нулями
df11[is.na(df11)] <- 0

# Строим ящик с усами
boxplot(df11$Age ~ df11$Response, xlab = "Response", ylab = "Age")

# Выводим строки, где возраст содержит хотя бы одну цифру 9
str_which(df11$Age, "[9]")

# Оставляем только те строки, где возраст содержит хотя бы одну цифру 9
df11 <- df11[str_which(df11$Age, "[9]"), ]
