# robotframework-and-skulix-calculator_desktop

Desktop testing in Windows Calculator app. This project contains basic examples on how to use Robot Framework and SikuliX to execut desktop automated tests in Windows Calculator app. Good practices such as hooks, custom commands and tags, among others, are used. All the necessary support documentation to develop this project is placed here.

# Pre-requirements:

| Requirement                     | Version        | Note                                                            |
| :------------------------------ |:---------------| :-------------------------------------------------------------- |
| JDK                             | 17             | -                                                               |
| SikuliX                         | 2.0.5          | -                                                               |
| Python                          | 3.13.4         | -                                                               |
| Visual Studio Code              | 1.89.1         | -                                                               |
| Robot Framework                 | 7.3.2          | -                                                               | 
| robotframework-SikuliLibrary    | 2.0.3          | -                                                               | 
| pyperclip                       | 1.9.0          | -                                                               | 
| robotframework-faker            | 5.0.0          | -                                                               |
| setuptools                      | 80.9.0         | -                                                               |  
| Robot Framework Language Server | 1.13.0         | -                                                               |

# Installation:

- See [Java SE 17 Archive Downloads (17.0.12 and earlier)](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html), download the proper version for your OS and install it by keeping the preferenced options. 
  - Right click :point_right: **My Computer** and select :point_right: **Properties**. On the :point_right: **Advanced** tab, select :point_right: **Environment Variables**, and then, in System Variables, create a variable named JAVA_HOME to point to where the JDK software is located, for example, C:\Program Files\Java\jdk-17.
  - Right click :point_right: **My Computer** and select :point_right: **Properties**. On the :point_right: **Advanced** tab, select :point_right: **Environment Variables**, and then edit Path system variable with the new %JAVA_HOME%\bin entrie.
- See [SikuliX Downloads](https://raiman.github.io/SikuliX1/downloads.html), :point_right: **Download the ready to use sikulixide-2.0.5.jar (SikuliX IDE for all systems)**
- See [python page](https://www.python.org/downloads/) and download the latest Python stable version. Start the installation and check the checkboxes below: 
  - :white_check_mark: Use admin privileges when installing py.exe 
  - :white_check_mark: Add python.exe to PATH
and keep all the other preferenced options as they are.
- See [Visual Studio Code page](https://code.visualstudio.com/) and install the latest VSC stable version. Keep all the prefereced options as they are until you reach the possibility to check the checkboxes below: 
  - :white_check_mark: Add "Open with code" action to Windows Explorer file context menu. 
  - :white_check_mark: Add "Open with code" action to Windows Explorer directory context menu.
Check then both to add both options in context menu.
- Open windows propmpt as admin and execute ```pip install robotframework``` to install Robot Framework.
- Open windows propmpt as admin and execute ```pip install robotframework-SikuliLibrary``` to install robotframework-SikuliLibrary.
- Open windows propmpt as admin and execute ```pip install pyperclip``` to install pyperclip.
- Open windows propmpt as admin and execute ```pip install robotframework-faker``` to install robotframework-faker.
- Open windows propmpt as admin and execute ```pip install setuptools``` to install setuptools package.
- Look for Robot Framework Language Server in the extensions marketplace and install the one from Robocorp.

# Tests:

- Execute ```robot -d ./results tests``` to run all tests in headless mode and store results in separated folder.
- Execute ```robot -d ./results .\tests\add.robot``` to run all the tests in the add.robot suite in headless mode and store results in separated folder.

# Support:

- [SikuliX](http://sikulix.com/)
- [robotframework-SikuliLibrary](https://github.com/MarketSquare/robotframework-SikuliLibrary)
- [SikuliLibrary](https://marketsquare.github.io/robotframework-SikuliLibrary/docs/SikuliLibrary.html)
- [Index - SikuliX 2.x+](https://sikulix-2014.readthedocs.io/en/latest/genindex.html)
- [FakerLibrary](https://marketsquare.github.io/robotframework-faker/)
- [String](https://robotframework.org/robotframework/latest/libraries/String.html#Remove%20String)
- [OperatingSystem](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html)
- [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [pyperclip](https://pypi.org/project/pyperclip/)
- [Welcome to Pyperclip’s documentation!](https://pyperclip.readthedocs.io/en/latest/)

# Tips:

- If timeout error occurs, increase sleep between steps.  
