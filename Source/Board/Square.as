class Square
{
	Piece@ HeldPiece;
	bool HasPiece;
	Square(){}
	void SetPiece(Piece &in piece){
		HasPiece	= true;
		HeldPiece	= piece;
	}

	void RemovePiece(){}
}