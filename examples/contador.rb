require 'actor'

contador = Actor.spawn do
  valor = 0
  loop do
    case Actor.receive
      when :cuenta then valor += 1
      when :valor then puts "El valor es: " + valor.to_s
      else puts "Mensaje desconocido"
    end
  end
end
