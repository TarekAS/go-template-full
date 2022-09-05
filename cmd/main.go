package main

import (
	"gosample/internal/mypkg"
	"os"

	"github.com/joho/godotenv"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func main() {
	loadDotEnv()
	configureLogger()
	mypkg.Hello()
	log.Error().Msg("This is an error!")
}

func loadDotEnv() {
	if err := godotenv.Load(); err != nil {
		log.Fatal().Err(err).Msg("Error loading .env file")
	}
}

func configureLogger() {
	if os.Getenv("DEV") == "1" {
		log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})
	} else {
		zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	}
}
