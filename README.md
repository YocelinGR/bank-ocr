# BankOcr

## Functionalities Design
In order to give manteinlability, the functionality will be divided on modules depending on the scopes:
- File Validator: file type, file not empty
- File manager: reader and generetor
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

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bankocr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bankocr, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bankocr](https://hexdocs.pm/bankocr).

