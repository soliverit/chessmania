/*
	Parent class for Pieces
*/
class Piece
{		
	// Colour names
	string WHITE		= "White";	// Piece colour label - should be static (const didn't work)
	string BLACK		= "Black";	// Piece colour label - should be static (const didn't work)
	string	Colour;					// Piece colour - should be static (const didn't work)
	string Type;					// Piece alias
	string Letter		= ".";		// chess.ttf label
	string UCILetter	= ".";		// FEN code (called UCI here a) inputs are UCI b) I read backwards

	Piece(){}
	/*
		Params:
			white:		bool is a white piece (colour handling's a bit messy. First plugin and all that.)
			pieceType:	string Piece type name (couldn't figure out how to get type name when passing as Piece)
			Letter:		string chess.ttf character
			uciLetter:	FEN character code (called uciLetter from confusion. Kind of related, though)
	*/
	Piece(bool white, string pieceType, string letter, string uciLetter){ 
		Colour 		= white ? WHITE: BLACK;
		Type		= pieceType;
		Letter		= letter;
		UCILetter	= Colour == WHITE ? uciLetter.ToUpper() : uciLetter.ToLower();
	}
}