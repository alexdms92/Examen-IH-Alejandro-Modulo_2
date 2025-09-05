package Clases;

public class Poker
{
    protected String nombre;
    protected int edad;
    protected String sexo;
    protected int posicion;

    public Poker(String nombre, int edad, String sexo, int posicion)
    {
        this.nombre = nombre;
        this.edad = edad;
        this.sexo = sexo;
        this.posicion = posicion;
    }
    
    public String getNombre()
    {
        return nombre;
    }
    
    public int getEdad()
    {
        return edad;
    }
    
    public String getsexo()
    {
        return sexo;
    }

    public int posicion()
    {
        return posicion;
    }
    
        @Override

    public String toString()
    {

        return "Poker{nombre='" + nombre + "', edad=" + edad + ", sexo=" + sexo + ", posicion=" + posicion + '}';

    }



    public void data()
    {
        System.out.println("Nombre: " + nombre);
        System.out.println("Edad: " + edad);
        System.out.println("sexo: " + sexo);
        System.out.println("posicion: " + posicion);

    }
}