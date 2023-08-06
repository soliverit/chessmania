class Move
{
	Board GameBoard;
	Player ThePlayer;
	Piece@ ThePiece;
	vec2 StartPosition;
	vec2 EndPosition;
	string[] LetterLabels	= {"A", "B", "C", "D", "E", "F", "G", "H"};
	string[] NumberLabels	= {"1", "2", "3", "4", "5", "6", "7", "8"};
	Move(){}
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