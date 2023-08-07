/*
	Square on the Board
*/
class Square
{
	Piece HeldPiece;			// Piece on the space
	bool HasPiece	= false;	// No idea how to get is null working in as. Dirty patch
	Square(){}
	void SetPiece(Piece piece){
		HasPiece	= true;
		HeldPiece	= piece;
	}
	/*
		Set the square as having no Piece (still has last Piece)
	*/
	void RemovePiece(){
		HasPiece	= false;
	}
}