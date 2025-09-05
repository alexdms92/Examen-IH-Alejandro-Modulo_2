import java.util.ArrayList;


import Clases.Poker;

public class App
{
    public static void main(String[] args)
    {
        Poker poker1 = new Poker ("Alex", 35, "Hombre", 6);
        Poker poker2 = new Poker ("Daniela", 35, "Mujer", 4);
        Poker poker3 = new Poker ("Pepe", 35, "Hombre", 1);
        Poker poker4 = new Poker ("Sofia", 35, "Mujer", 3);
        Poker poker5 = new Poker ("Raquel", 35, "Mujer", 2);
        Poker poker6 = new Poker ("Javier", 35, "Hombre", 5);

       
        ArrayList<Poker> jugadores = new ArrayList<Poker>();

        jugadores.add(poker1);
        jugadores.add(poker2);
        jugadores.add(poker3);
        jugadores.add(poker4);
        jugadores.add(poker5);
        jugadores.add(poker6);

        System.out.println(jugadores);
    }
}