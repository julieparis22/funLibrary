// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import "controllers"

// Initialise rails-ujs
Rails.start()

// Autres configurations ou dépendances
