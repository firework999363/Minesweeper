

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20github
int NUM_COLS = 20;
int NUM_ROWS = 20;
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
    
    setBombs(10);
}
public void setBombs(int boom)
{
    int r1 = (int)(Math.random()*20);
    int c1 = (int)(Math.random()*20);
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
    for(int i = 0; i < boom; i++) {
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
        if (keyPressed == true)
        {
            marked = !marked;
        }
        if(bombs.contains(this))
        {
            displayLosingMessage();
        }
        else if (countBombs(r,c)>0)
        {
            setLabel(""+countBombs(r,c));
        }
        else
        {
            if(isValid(r+1,c) && buttons[r+1][c].isClicked() == false)
            {
                buttons[r-1][c].mousePressed();
            }
            if(isValid(r-1,c) && buttons[r-1][c].isClicked() == false)
            {
                buttons[r-1][c].mousePressed();
            }
            if(isValid(r,c+1) && buttons[r][c+1].isClicked() == false)
            {
                buttons[r][c+1].mousePressed();
            }
            if(isValid(r,c-1) && buttons[r][c-1].isClicked() == false)
            {
                buttons[r][c-1].mousePressed();
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
        if (r<20 && c<20)
        {
            return true;
        }
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if (isValid(row+1,col))
        {
            if(bombs.contains(buttons[row+1][col]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row,col+1))
        {
            if(bombs.contains(buttons[row][col+1]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row-1,col))
        {
            if(bombs.contains(buttons[row-1][col]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row,col-1))
        {
            if(bombs.contains(buttons[row][col-1]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row+1,col+1))
        {
            if(bombs.contains(buttons[row+1][col+1]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row-1,col-1))
        {
            if(bombs.contains(buttons[row-1][col-1]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row+1,col-1))
        {
            if(bombs.contains(buttons[row+1][col-1]))
            {
                numBombs=numBombs+1;
            }
        }
        if (isValid(row-1,col+1))
        {
            if(bombs.contains(buttons[row-1][col+1]))
            {
                numBombs=numBombs+1;
            }
        }
        return numBombs;
    }
}



