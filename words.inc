section .rodata

colon 'first_word', first_word ; вызов макроса для размещения блока ('ключ', уникальное имя метки блока)
db 'first word definition', 0 ; значение, хранящееся в блоке

colon 'second_word', second_word
db 'second word definition', 0

colon 'third_word', third_word
db 'third word definition', 0


colon 'ITMO', ITMO
db 'an IT university in Saint-Petersburg, Russia', 0

colon 'BT', BT
db 'Why are we still here? Just to suffer', 0

colon 'academicaldifference', academdif
db 'a tool to make people dead inside (1000-7)', 0

colon 'c++', cplusplus
db 'Im fast as heck boiiiiii', 0

colon 'Unity', Unity
db 'the greatest game engine ever created', 0

colon 'GameDev', GameDev
db 'an amazing place to feel like you\re nothing', 0