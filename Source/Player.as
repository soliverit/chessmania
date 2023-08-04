class Player
{
	string WHITE_NAME	= "White";
	string BLACK_NAME	= "Black";
	string Colour;
	// Pieces
	Pawn Pawn1;
	Pawn Pawn2;
	Pawn Pawn3;
	Pawn Pawn4;
	Pawn Pawn5;
	Pawn Pawn6;
	Pawn Pawn7;
	Pawn Pawn8;
	Bishop TheFirstBishop;
	Bishop TheSecondBishop;
	Castle TheFirstCastle;
	Castle TheSecondCastle;
	Horse TheFirstHorse;
	Horse TheSecondHorse;
	King TheKing;
	Queen TheQueen;
	// Constructors
	Player(){}
	bool White;
	Player(bool white){Colour = white ? WHITE_NAME: BLACK_NAME;}
	void CreatePieces()
	{
		bool isWhite	= IsWhite();
		TheFirstBishop	= Bishop(isWhite);
		TheSecondBishop	= Bishop(isWhite);
		TheFirstCastle	= Castle(isWhite);
		TheSecondCastle	= Castle(isWhite);
		TheFirstHorse	= Horse(isWhite);
		TheSecondHorse	= Horse(isWhite);
		TheKing		= King(isWhite);
		TheQueen	= Queen(isWhite);
		Pawn1		= Pawn(isWhite);
		Pawn2		= Pawn(isWhite);
		Pawn3		= Pawn(isWhite);
		Pawn4		= Pawn(isWhite);
		Pawn5		= Pawn(isWhite);
		Pawn6		= Pawn(isWhite);
		Pawn7		= Pawn(isWhite);
		Pawn8		= Pawn(isWhite);
	}
	bool IsWhite(){return Colour == WHITE_NAME;}
}