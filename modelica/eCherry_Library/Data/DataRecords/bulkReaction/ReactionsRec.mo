within eCherry_Library.Data.DataRecords.BulkReaction;
record ReactionsRec
  ReactionHom reac[:] "Array of reactions to be used in a model";
      constant Integer nReac = size(reac, 1);
end ReactionsRec;
