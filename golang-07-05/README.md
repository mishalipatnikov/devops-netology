### 1. Напишите программу для перевода метров в футы (1 фут = 0.3048 метр). 

```
package main

import "fmt"

func main() {
	fmt.Print("Enter a metr: ")
	var metr float64
	fmt.Scanf("%f", &metr)

	foot := metr / 0.3048

	fmt.Println(foot)
}
```

### 2. Напишите программу, которая найдет наименьший элемент в любом заданном списке, например:
```
x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
```

```
package main

import (
	"fmt"
)

func main() {
	x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17,}

	min := x[0]
	for _, element := range x {
		if element < min {
			min = element
		}
	}

	fmt.Println(min)
}
```

### 3. Напишите программу, которая выводит числа от 1 до 100, которые делятся на 3. То есть (3, 6, 9, …).

```
package main

func main() {

	for i := 1; i < 100; i++ {
		if i%3 == 0 {
			println(i)
		}
	}
}

```