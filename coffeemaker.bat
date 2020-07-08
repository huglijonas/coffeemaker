@echo off
Title CoffeeMaker
set cups=5
set water=20
set beans=100
set goutte=0

:BEGIN
color 0a
echo     *---------------------------------*               ..              *---------------------------------*
echo     ^|             CCCCCCCCCCCCC       ^|             ..  ..            ^| MMMMMMMM               MMMMMMMM ^|
echo     ^|          CCC::::::::::::C       ^|                   ..          ^| M:::::::M             M:::::::M ^|
echo     ^|        CC:::::::::::::::C       ^|                    ..         ^| M::::::::M           M::::::::M ^|
echo     ^|       C:::::CCCCCCCC::::C       ^|                   ..          ^| M:::::::::M         M:::::::::M ^|
echo     ^|      C:::::C       CCCCCC       ^|                  ..           ^| M::::::::::M       M::::::::::M ^|
echo     ^|     C:::::C                     ^|       ##       ..    ####     ^| M:::::::::::M     M:::::::::::M ^|
echo     ^|     C:::::C                     ^|       ##.............##  ##   ^| M:::::::M::::M   M::::M:::::::M ^|
echo     ^|     C:::::C                     ^|       ##.............##   ##  ^| M::::::M M::::M M::::M M::::::M ^|
echo     ^|      C:::::C       CCCCCC       ^|       ##.............## ##    ^| M::::::M  M::::M::::M  M::::::M ^|
echo     ^|       C:::::CCCCCCCC::::C       ^|       ##.............###      ^| M::::::M   M:::::::M   M::::::M ^|
echo     ^|        CC:::::::::::::::C       ^|        ##...........##        ^| M::::::M    M:::::M    M::::::M ^|
echo     ^|          CCC::::::::::::C       ^|         #############         ^| M::::::M     MMMMM     M::::::M ^|
echo     ^|             CCCCCCCCCCCCC       ^|         #############         ^| MMMMMMMM               MMMMMMMM ^|
echo     *---------------------------------*       #################       *---------------------------------*
echo.
echo  *--------------*
echo  ^| 0  : Choices ^|
echo  ^| 1  : Info    ^|
echo  ^| 2  : Drink   ^|
echo  ^| 3  : Make    ^|
echo  ^| 4  : Fill    ^|
echo  ^| 5  : Buy     ^|
echo  ^| 6  : Goutte  ^|
echo  ^| 7  : Exit    ^|
echo  *--------------*
echo.
:CHOICE
echo Choose an option: 
set /p choose=">"

if "%choose%"=="0" (
    GOTO BEGIN
)
if "%choose%"=="1" (
    echo       INFORMATIONS
    echo *----------------------*
    echo   Cups left:     %cups%
    echo   Water left:    %water%
    echo   Beans left:    %beans%
    echo *----------------------*
    echo.
)
if "%choose%"=="2" (
    if %cups% gtr 0 (
        echo You're drinking a cup of coffee.
        set /a cups -= 1
        echo.
        GOTO CHOICE
    )
    if %cups%==0 (
        set /a goutte=0
        echo You cannot drink coffee. There is no more! You need to make some!
        echo.
        GOTO CHOICE
    )
)
if "%choose%"=="3" (
    if %cups% gtr 0 (
        echo You have %cups% cups in your coffee pot!
        echo.
        GOTO CHOICE
    )
    if %cups%==0 (
        if %water%==0 (
            echo You cannot make coffee! You need to fill your coffee pot with some water!
            echo.
            GOTO CHOICE
        )
        if %beans%==0 (
            echo You cannot make coffee! You need some beans!
            echo.
            GOTO CHOICE
        )
        if %water% gtr 0 (
            if %beans% gtr 0 (
                set /a cups=5
                set /a water-=10
                set /a beans-=20
                echo You're making some coffee!
                echo.
                GOTO CHOICE
            )
        )
    )
)
if "%choose%"=="4" (
    if %water% gtr 0 (
        echo You cannot fill your coffee pot! There is %water% in it!
        echo.
        GOTO CHOICE
    )
    if %water%==0 (
        set /a water+=20
        echo You're filling your coffee pot with some water!
        echo.
        GOTO CHOICE
    )
)
if "%choose%"=="5" (
    set /a beans+=50
    echo You bought some coffee beans in the market!
    echo.
    GOTO CHOICE
)
if "%choose%"=="6" (
    if %cups%==0 (
        echo You cannot use 'goutte'! Do not have coffee!
        echo.
        GOTO CHOICE
    )
    if %cups% gtr 0 (
        set /a goutte+=1
        set /a cups-=1
        echo You're adding some 'goutte' in your coffee! It's delicious!
        echo.
        if %goutte% geq 5 (
            set /a goutte=0
            echo *-------------------------------------*
            echo ^| Yes! You're drunk! Congrats fellow! ^|
            echo *-------------------------------------*
            echo ^|              YOU WON                ^|
            echo *-------------------------------------*
            echo.
            pause
            exit
        )
        GOTO CHOICE
    )
)
if "%choose%"=="7" exit

set choice=0
GOTO CHOICE
