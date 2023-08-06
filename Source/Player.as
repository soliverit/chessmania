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
	Rook TheFirstRook;
	Rook TheSecondRook;
	Horse TheFirstHorse;
	Horse TheSecondHorse;
	King TheKing;
	Queen TheQueen;
	// Player type
	bool IsAI;
	bool IsThinking;
	string NextMove;
	// Constructors
	Player(){}
	bool White;
	Player(bool white, bool isAI){
		Colour 	= white ? WHITE_NAME: BLACK_NAME;
		IsAI	= isAI
	}
	void Think(string brainURL)
	{
		IsThinking	= true;
		NextMove	= "";
        Net::HttpRequest@ req = Net::HttpRequest();
        req.Method = Net::HttpMethod::Get;
        req.Url = brainURL;
        req.Start();
        while (!req.Finished()) {
            yield();
        }
		print("--- AI RESPONDS WITH ---");
		print(req.ResponseHeader());
		NextMove = "Shoe";
		IsThinking	= false;
	}
	void CreatePieces()
	{
		
		bool isWhite	= IsWhite();
		TheFirstBishop	= Bishop(isWhite);
		TheSecondBishop	= Bishop(isWhite);
		TheFirstRook	= Rook(isWhite);
		TheSecondRook	= Rook(isWhite);
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