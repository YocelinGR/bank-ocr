# BankOcr

## Functionalities Design
In order to give manteinlability, the functionality will be divided on modules depending on the scopes:
- File Validator: file type, file not empty
- File manager: reader and write
- Digits converter: identify digits on one number in range: [0, 9] or '?' if different
- Account validator: Make calculations and return an tuple with the account number and the result of the evaluation as atom

## Performance
There are task that will take some time 
- The file reader and the digit converter are taks that will take some time
- The file will have many entries

To make better manage of the processes and for futher improvements I will sugest:
- Save file information on DB and return a fast response that make user know that the file is processed
- Make process on background 
- Make get endpoints or functions to consult the process information 
- If the file is too long will be managed on parts

## OCR digits
- Based on a string with a content like the one that is specified, the string will:
  - Be converted to a list with one row per element
  - Divided on grouos of 3 rows
  - Each group will be processed to have its content divided on groups of 3
  - Now we can form list with 3 elements, each one with a string of length of 3
  - Each list will be compared with the lcd digits to have it integer number
  - Each digit will conform a line with 37 characters each one
- Each line is procesed to get the calculation per account and evaluate if the result is: OK, ERR or ILL

## Scope
- Givin a string with the lcd digits, convert to integer and evaluate each account
## Missing
- Unit Test
- Receive a file and make all the process
- Write on a file the result
- Manage the process that will be slow: this will be managed with a polling system, with task async processes or with a Cron task to distribute charge over time. Even this will be run on backgrounf with a GenServer worker to continue running with detain the main function response
## Failing 
- I have a problem with row border characters that makes the lcd digits to integer fail in somre characters
## Run
Execute ´iex -S mix´ and execute the function: ´BankOcr.bank_ocr()´ on the elixir console

