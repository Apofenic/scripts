
#!/bin/bash
echo "salary 1 amount?"

read sal1

echo "salary 2 amount?"

read sal2

echo "bill amount?"

read bill

total=$((sal1 + sal2))

echo $total
