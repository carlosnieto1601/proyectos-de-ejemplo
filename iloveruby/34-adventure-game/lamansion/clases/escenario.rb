#
# Autor: David Vargas <dvargas@canarias.org>
#

class Escenario
  attr_reader :objetos, :habitaciones 

  def initialize
    @objetos = []
    @habitaciones = []
  end

  def cargar_escenario(fichero='datos/escenario.txt')
    @fichero = fichero if fichero.length>0
    f=File.new(@fichero).readlines 
    h = Habitacion.new
    o = Objeto.new   

    f.each do |str|
       if str[0..9]=='Habitacion'
          h = Habitacion.new_from_cadena(str)
          @habitaciones << h
       elsif str[0..5]=='Objeto'
          o = Objeto.new_from_cadena(str,@habitaciones)
          @objetos << o
       end
    end
  end

end
