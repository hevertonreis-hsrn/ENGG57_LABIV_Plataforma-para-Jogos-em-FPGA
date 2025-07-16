# ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA
## visual_processing_unit
Este projeto utiliza simulações via ModelSim (Mentor Graphics).  
Para que a simulação funcione corretamente, **você precisa ajustar o caminho da variável `QSYS_SIMDIR` no arquivo `mentor.do`**.

O arquivo se encontra em: "CAMINHO DO USUARIO"\ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA\visual_processing_unit\embedded_vpu\simulation_nios2

Você encontrará uma linha parecida com esta:

```tcl
set QSYS_SIMDIR C:/Projects/Quartus/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/visual_processing_unit/embedded_vpu/testbench/
```
Altere para:
```tcl
set QSYS_SIMDIR "CAMINHO DO USUARIO"/ENGG57_LABIV_Plataforma-para-Jogos-em-FPGA/visual_processing_unit/embedded_vpu/testbench/
```

Para a simulação, deve-se copiar o mento.do e os demais arquivos contidos em simulation_nios2 para: `“...visual_processing_unit\software\nios2_processor\obj\default\runtime\sim\mentor”`

Após a copia dos arquivos, execute no nios2 dentro do Workspace do visual_processing_unit: `Run -> Run as -> Nios II ModelSim` **(apenas aparece se nios2_processor estiver selecionado em Project Explorer)**.

No ModelSim, execute:

```tcl
do mentor.do
```
