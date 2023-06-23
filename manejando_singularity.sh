#!/bin/bash

echo "script ejecutado con salida en output_manejando_singularity.txt"
echo


# Eliminamos output_manejando_singularity.txt si existe
rm -f output_manejando_singularity.txt
# Redireccionar salida estándar y salida de error al archivo de texto
exec >> output_manejando_singularity.txt 2>&1

# *** Comando hostname en ibsen
echo "*** Comando hostname en ibsen:"
hostname
echo
echo "Cargamos singularity con module load singularity/3.8.0"
module load singularity/3.8.0

# Comando hostname en el contenedor my-python.sif de Singularity
echo -e "\n*** Comando hostname en el contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif hostname

# Comando cat /etc/os-release en ibsen
echo -e "\n*** Comando cat /etc/os-release en ibsen:"
cat /etc/os-release

# Comando cat /etc/os-release en el contenedor my-python.sif de Singularity
echo -e "\n*** Comando cat /etc/os-release en el contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif cat /etc/os-release

# Comando pwd en ibsen
echo -e "\n*** Comando pwd en ibsen:"
pwd

# Comando pwd en el contenedor my-python.sif de Singularity
echo -e "\n*** Comando pwd en el contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif pwd

# Comando ls -l /home en ibsen
echo -e "\n*** Comando ls -l /home en ibsen:"
ls -l /home

# Comando ls -l /home en el contenedor my-python.sif de Singularity
echo -e "\n*** Comando ls -l /home en el contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif ls -l /home

# Comando python --version en ibsen
echo -e "\n*** Comando python --version en ibsen:"
python --version

# Comando python --version en el contenedor my-python.sif de Singularity
echo -e "\n*** Comando python --version en el contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif python --version

# Ejecución de kmer-solution.ipynb en el subdirectorio source dentro de la imagen Singularity
echo -e "\n*** Ejecución de kmer-solution.ipynb en el subdirectorio source de la imagen Singularity:"
singularity exec ./singularity/my-python.sif jupyter nbconvert --execute  ./source/kmer-solution.ipynb

# Ejecución de kmer-solution.ipynb en el propio contenedor my-python.sif de Singularity
echo -e "\n*** Ejecución de kmer-solution.ipynb en el propio contenedor my-python.sif de Singularity:"
singularity exec ./singularity/my-python.sif jupyter nbconvert --execute /home/kmer-solution.ipynb