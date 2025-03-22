# !/bin/bash
# Programa para revisar los tipos de operadores.
# Autor: Juan Grisales - juan.grisalesarias@gmail.com

numA=10
numB=4

echo "Operadores Aritméticos"
echo "Número A: $numA"
echo "Número B: $numB"

echo "Sumar A + B: =" $((numA+numB))
echo "Restar A + B: =" $((numA-numB))
echo "Multiplicar A + B: =" $((numA*numB))
echo "Dividir A + B: =" $((numA/numB))
echo "Residuo A + B: =" $((numA%numB))


echo -e "\n Operadores Relacionales"
echo "Número A: $numA"
echo "Número B: $numB"

echo "A > B" $((numA>numB))
echo "A < B" $((numA<numB))
echo "A >= B" $((numA>=numB))
echo "A <= B" $((numA<=numB))
echo "A == B" $((numA==numB))
echo "A != B" $((numA!=numB))

echo -e "\n Operadores de Asignación"
echo "Número A: $numA"
echo "Número B: $numB"

echo "Sumar A += B" $((numA+=numB))
echo "Restar A -= B" $((numA-=numB))
echo "Multiplicar A *= B" $((numA*=numB))
echo "Dividir A /= B" $((numA/=numB))
echo "Residuo A %= B" $((numA%=numB))

