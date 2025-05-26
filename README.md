# ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA
## ModuloVGAController
Este projeto utiliza simulações via ModelSim (Mentor Graphics).  
Para que a simulação funcione corretamente, **você precisa ajustar o caminho da variável `QSYS_SIMDIR` no arquivo `mentor.do`**.

O arquivo se encontra em: "CAMINHO DO USUARIO"\ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA\ModuloVGAController\EmbarcadoVGA\testbench\mentor

Você encontrará uma linha parecida com esta:

```tcl
set QSYS_SIMDIR C:/Projects/Quartus/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloVGAController/EmbarcadoVGA/testbench/
```
Altere para:
```tcl
set QSYS_SIMDIR "CAMINHO DO USUARIO"/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloVGAController/EmbarcadoVGA/testbench/
```

No ModelSim, basta executar:
```tcl
do "CAMINHO DO USUARIO"/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/ModuloVGAController/EmbarcadoVGA/testbench/mentor/mentor.do
```
