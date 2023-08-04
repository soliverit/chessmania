class Player
{
	const string WHITE_NAME	= "White";
	const string BLACK_NAME	= "Black";
	Pawn[] Pawns;
	Bishop TheFirstBishop;
	Bishop TheSecondBishop;
	Castle TheFirstCastle;
	Castle TheSecondCastled;
	Horse TheFirstHorse;
	Horse TheSecondHorse;
	King TheKing;
	Queen TheQueen;
	Player(){}
	bool White;
	Player(bool white){Colour = white ? WHITE_NAME: BLACK_NAME;}
	void CreatePieces()
	{
		
		TheFirstBishop	= Bishop(IsWhite());
		TheSecondBishop	= Bishop(IsWhite());
		TheFirstCastle	= Castle(IsWhite());
		TheSecondCastle	= Castle(IsWhite());
		TheFirstHorse	= Horse(IsWhite());
		TheSecondHorse	= Horse(IsWhite());
		TheKing		= King(IsWhite());
		TheQueen	= Queen(IsWhite());
		Pawns 		= Pawn[](
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite()),
			Pawn(IsWhite())
		);
	}
	bool IsWhite(){return Colour == WHITE_NAME;}
}