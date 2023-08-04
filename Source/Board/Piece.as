class Piece
{		
	/*
		TODO: 	The instance GetTexture is probably  better done
				as a global pre-game process. But, fuck it for now.
	*/
	// Piece URLs
	string BLACK_BISHOP	= "https://imgur.com/IhbPzZe";
	string WHITE_BISHOP	= "https://imgur.com/Ei6L27t";
	string WHITE_ROOK	= "https://imgur.com/FXujOwb";
	string BLACK_ROOK	= "https://imgur.com/PYcSTic";
	string WHITE_HORSE	= "https://imgur.com/5Yqfs5M";
	string BLACK_HORSE	= "https://imgur.com/Zg2E8fZ";
	string WHITE_KING 	= "https://imgur.com/jJywYkv";
	string BLACK_KING	= "https://imgur.com/Ei6L27t";
	string WHITE_PAWN	= "https://imgur.com/mXVYpPw";
	string BLACK_PAWN	= "https://imgur.com/0xYAg2D";
	string WHITE_QUEEN	= "https://imgur.com/5y5LoRy";
	string BLACK_QUEEN	= "https://imgur.com/Pre42TI";
	// Colour names
	string WHITE		= "White";
	string BLACK		= "Black";
	string	Colour;
	string Type;
	string Letter		= "";
	// Image stuff
	string ImageURL;
	UI::Texture@ Image;
	Piece(){}
	Piece(bool white, string pieceType, string letter){ 
		Colour 	= white ? WHITE: BLACK;
		Type	= pieceType;
		Letter	= letter;
		if(white)
		{
			if(pieceType == "Bishop"){ImageURL = WHITE_BISHOP;}
			else if(pieceType == "Rook"){ImageURL	= WHITE_ROOK;}
			else if(pieceType == "Horse"){ImageURL	= WHITE_HORSE;}
			else if(pieceType == "King"){ImageURL	= WHITE_KING;}
			else if(pieceType == "Pawn"){ImageURL	= WHITE_PAWN;}
			else if(pieceType == "Queen"){ImageURL	= WHITE_QUEEN;}
		}else{
			if(pieceType == "Bishop"){ImageURL = BLACK_BISHOP;}
			else if(pieceType == "Rook"){ImageURL	= BLACK_ROOK;}
			else if(pieceType == "Horse"){ImageURL	= BLACK_HORSE;}
			else if(pieceType == "King"){ImageURL	= BLACK_KING;}
			else if(pieceType == "Pawn"){ImageURL	= BLACK_PAWN;}
			else if(pieceType == "Queen"){ImageURL	= BLACK_QUEEN;}
		}
		// GetTexture();
	}
	
	void GetTexture()
	{
		auto req	= Net::HttpRequest();
        req.Method 	= Net::HttpMethod::Get;
        req.Url 	= ImageURL;
        req.Start();
        while (!req.Finished()) {yield();}
		print("Piece image loaded: " + ImageURL);
		@Image		= UI::LoadTexture(req.Buffer());
	}
}