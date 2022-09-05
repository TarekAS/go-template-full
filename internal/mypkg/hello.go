package mypkg

import (
	"github.com/rs/zerolog/log"
)

func Hello() {
	log.Info().Msg("Hello!")
}

// Sums two integers
func Add(x, y int) (res int) {
	return x + y
}
