# BankOcr

## Functionalities Design
In order to give maintainability, the functionality will be divided into modules depending on the scopes:
- File Validator: file type, file not empty
- File manager: reader and write
- Digits converter: identify digits on one number in the range: [0, 9] or '?' if different
- Account validator: Make calculations and return a tuple with the account number and the result of the evaluation as an atom

## Performance
There are tasks that will take some time 
- The file reader and the digit converter are tasks that will take some time
- The file will have many entries

To make a better management of the processes and for further improvements, I will suggest:
- Save file information on DB and return a fast response that makes the user know that the file is processed
- Make process on the background 
- Make get endpoints or functions to consult the process information 
- If the file is too long will be managed on parts

## OCR digits
- Based on a string with content like the one that is specified, the string will:
  - Be converted to a list with one row per element
  - Divided into groups of 3 rows
  - Each group will be processed to have its content divided into groups of 3
  - Now we can form a list with 3 elements, each one with a string of length of 3
  - Each list will be compared with the LCD digits to have its an integer number
  - Each digit will conform to a line with 37 characters each one
- Each line is processed to get the calculation per account and evaluate if the result is: OK, ERR or ILL

## Scope
- Givin a string with the LCD digits, convert to integer and evaluate each account
- Receive a file and make all the process
- Write on a file the result
## For future
- Unit Test
- Manage the process that will be slow: this will be managed with a polling system, with task async processes or with a Cron task to distribute charge over time. Even this will be run in the background with a GenServer worker to continue running with detaining the main function response
- Validate the length of each line
- Validate the length of the list with the LCD representations
## Run
Execute `iex -S mix` and execute the function: `BankOcr.bank_ocr()` on the elixir console

