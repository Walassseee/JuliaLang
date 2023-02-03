# Usando Código R e Python no Julia
ENV["PYTHON"] = "C:\\Users\\brcpwmftomaz\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Python 3.9\\Python 3.9 (64-bit).exe";
ENV["R_HOME"] = "C:\\Users\\brcpwmftomaz\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\R\\R 4.2.2.exe";

using Pkg
pkg"add RCall"
pkg"add PyCall"

using RCall
using PyCall

@time R"

print('This Code Is In R')

"

@time py"

print('This Code Is In Python')

"

@time print("This Code Is In Julia")

@time R"

read.csv('Dados.csv')

"

py"

import pandas as pd
pd.read_csv('Dados.csv')

"