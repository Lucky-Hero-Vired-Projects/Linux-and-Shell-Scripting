#!/bin/bash

# Function to perform calculations
calculate() {
  local num1=$1
  local num2=$2
  local operator=$3

  case $operator in
    +)
      result=$(echo "$num1 + $num2" | bc)
      ;;
    -)
      result=$(echo "$num1 - $num2" | bc)
      ;;
    \*)
      result=$(echo "$num1 * $num2" | bc)
      ;;
    /)
      if [ "$num2" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
        exit 1
      fi
      result=$(echo "scale=2; $num1 / $num2" | bc)
      ;;
    %)
      result=$(echo "scale=2; $num1 * $num2 / 100" | bc)
      ;;
    *)
      echo "Error: Invalid operator. Use +, -, *, /, or %."
      exit 1
      ;;
  esac

  echo "Result: $result"
}

# Prompt user for input
echo "Enter the first number:"
read num1

echo "Enter the second number:"
read num2

echo "Enter the operator (+, -, *, /, %):"
read operator

# Perform the calculation
calculate "$num1" "$num2" "$operator"
