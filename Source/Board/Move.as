/*
	A struct for Player moves.
*/
class Move
{
	Board GameBoard;		// Game Board
	Player ThePlayer;		// The Player who moved
	Piece@ ThePiece;		// The affected Piece - Think it's missing ironically. Isn't used yet.
	vec2 StartPosition;		// Where the Piece was
	vec2 EndPosition;		// Where the Piece is
	string[] LetterLabels	= {"A", "B", "C", "D", "E", "F", "G", "H"};	// Letter labels for columns
	string[] NumberLabels	= {"1", "2", "3", "4", "5", "6", "7", "8"};	// Don't know how to cast ints as strings
	Move(){}
	/*
		Params:
			board:		Board game board
			player:		Player

	*/
	Move(Board board, Player Player, string move){
		GameBoard			= board;
		ThePlayer			= Player;
		string letter1		= move.SubStr(0, 1);
		string number1		= move.SubStr(1, 1);
		string letter2		= move.SubStr(2, 1);
		string number2	 	= move.SubStr(3, 1);
		StartPosition		= vec2(GetLetterIndex(letter1), GetRowIndex(number1));
		EndPosition			= vec2(GetLetterIndex(letter2), GetRowIndex(number2));
	}
	/*
		I don't know how to type case yet. Rather than ask I'll use this workaround.
	*/
	int GetRowIndex(string number)
	{
		for(uint numberID = 0; numberID < NumberLabels.Length; numberID++)
		{
			if(number == NumberLabels[numberID])
			{
				return 7 - numberID;
			}
		}
		return -1;
	}
	int GetLetterIndex(string letter)
	{
		letter	= letter.ToUpper();
		for(uint letterID = 0; letterID < LetterLabels.Length; letterID++)
		{
			if(letter == LetterLabels[letterID])
			{
				return letterID;
			}
		}
		return -1;
	}
}