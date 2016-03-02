

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20github
int NUM_COLS = 20;
int NUM_ROWS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    //your code to declare and initialize buttons goes here
    buttons= new MSButton[20][20];
    for(int l = 0; l<20; l++)
    {
        for(int k= 0; k<20; k++)
        {
            buttons[l][k] = new MSButton(l,k);
        }
    }
    
    setBombs(10);
}
public void setBombs(int boom)
{
    int r1 = (int)Math.random()*20;
    int c1 = (int)Math.random()*20;
    /*if (boom == 0)
    {}
    else
    {
        if (bombs.contains(buttons[r1][c1])) 
        {
            setBombs(boom);
        } 
        else
        {
            bombs.add(buttons[r1][c1]);
            setBombs(boom-1);
        }
    }*/
    for(int i = 0; i <= boom; i++) {
        if(bombs.contains(buttons[r1][c1])) {
            i--;
        }
        else {
            bombs.add(buttons[r1][c1]);
        }
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        //your code here
        return numBombs;
    }
}



