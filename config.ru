# This file is used by Rack-based servers to start the application.
require "dotenv/load"
require "net/http"
require "uri"
require "faker"
require "json"

require_relative "config/environment"

run Rails.application
