

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20github
int NUM_COLS = 20;
int NUM_ROWS = 20;
boolean gameOver;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    //your code to declare and initialize buttons goes here
    buttons= new MSButton[NUM_ROWS][NUM_COLS];
    for(int l = 0; l<NUM_ROWS; l++)
    {
        for(int k= 0; k<NUM_COLS; k++)
        {
            buttons[l][k] = new MSButton(l,k);
        }
    }
    gameOver = false;
    setBombs(40);
}
public void setBombs(int boom)
{
    for(int i = 0; i < boom; i++) {
        int r1 = (int)(Math.random()*20);
        int c1 = (int)(Math.random()*20);
        if(bombs.contains(buttons[r1][c1])) {
            i--;
        }
        else 
        {
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
    setLabel("GA");
    setLabel("ME");
    setLabel(" O");
    setLabel("VE");
    setLabel("R");
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
        if (keyPressed == true)
        {
            marked = !marked;
        }
        else if (gameOver == true || bombs.contains(this))
        {
            displayLosingMessage();
        }
        else 
        {
            clicked = true;
            if (countBombs(r,c)>0)
            {
                setLabel(""+countBombs(r,c));
            }
            else
            {
                for(int rr = -1; rr < 2; rr++)
                {
                    for(int cc = -1; cc < 2; cc++)
                    {
                        if(isValid(r+rr,c+cc) && buttons[r+rr][c+cc].isClicked() == false)
                        {
                            buttons[r+rr][c+cc].mousePressed();
                        }
                    }
                }
            }
        }
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
        if(r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS) 
        {
            return true; 
        }
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        for(int rr = -1; rr < 2; rr++)
        {
            for(int cc = -1; cc < 2; cc++)
            {
                if(isValid(row+rr,col+cc) && bombs.contains(buttons[row+rr][col+cc]))
                {
                    numBombs++;
                }
            }
        }
        return numBombs;
    }
}



