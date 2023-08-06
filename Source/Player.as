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
	bool Thining;
	Net::HttpRequest Thought;
	string NextMove;
	// Constructors
	Player(){}
	bool White;
	Player(bool white, bool isAI){
		Colour 	= white ? WHITE_NAME: BLACK_NAME;
		IsAI	= isAI;
	}
	bool ReadyToMove()
	{
		return NextMove != "";
	}
	void Think(string brainURL, string fenBOARD)
	{
		IsThinking	= true;
		NextMove	= "";
        Net::HttpRequest@ req = Net::HttpRequest();
		req.Body	= fenBOARD;
        req.Method = Net::HttpMethod::Get;
        req.Url = brainURL + "?fen="  +  Net::UrlEncode(fenBOARD);
        req.Start();
        while (!req.Finished()) {
            yield();
        }
		NextMove = req.Json().Get("message");
		IsThinking	= false;
	}
	string GetNextMoveCode()
	{
		string nextMoveCode	= NextMove;
		NextMove			= "";
		return nextMoveCode;
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