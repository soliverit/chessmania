class Square
{
	Piece HeldPiece;
	bool HasPiece	= false;
	Square(){}
	void SetPiece(Piece piece){
		HasPiece	= true;
		HeldPiece	= piece;
	}

	void RemovePiece(){
		HasPiece	= false;
	}
}