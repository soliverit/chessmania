class Square
{
	Piece@ HeldPiece;
	Square(){}
	void SetPiece(Piece@ piece){HeldPiece	= piece;}
	void RemovePiece(){HeldPiece	= null;}
}