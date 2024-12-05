Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:3000/api/v1/restaurants' # Cambia esto por el dominio que necesite acceso
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true # Permite enviar cookies o encabezados de autenticación
  end
end
