// Example of a table-driven unit test.
package mypkg_test

import (
	"gosample/internal/mypkg"
	"testing"
)

type addTest struct {
	arg1, arg2, expected int
}

var addTests = []addTest{
	{2, 3, 5},
	{4, 8, 12},
	{6, 9, 15},
	{3, 10, 13},
}

func TestAdd(t *testing.T) {
	for _, test := range addTests {
		if output := mypkg.Add(test.arg1, test.arg2); output != test.expected {
			t.Errorf("Output %q not equal to expected %q", output, test.expected)
		}
	}
}
