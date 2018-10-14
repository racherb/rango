{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wcompat #-}
{-# OPTIONS_GHC -Wincomplete-record-updates #-}
{-# OPTIONS_GHC -Wincomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wredundant-constraints #-}
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# OPTIONS_GHC -fwarn-unused-imports #-}
{-# OPTIONS_GHC -fwarn-unused-binds #-}
{-# OPTIONS_GHC -fwarn-unused-do-bind #-}
{-# OPTIONS_GHC -fwarn-wrong-do-bind #-}
{-# OPTIONS_GHC -fwarn-unused-matches #-}
{-# OPTIONS_GHC -fwarn-dodgy-exports #-}
{-# OPTIONS_GHC -fwarn-dodgy-imports #-}
{-# OPTIONS_GHC -fwarn-identities #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
--{-# OPTIONS_HADDOCK prune #-}
{-# LANGUAGE Safe #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE DeriveFunctor #-}

{-|
Module      : Data.Range.Types
Description : Simple Range Data Types
Copyright   : (c) Raciel Hernández, 2018
License     : SRU
Maintainer  : racherb@protonmail.com
Stability   : experimental
Portability : Portable

The @'Range' a@ type.
Module of simple operations of Range type data defined as a closed interval in mathematics.

<<license-SRU-L1.svg>> <<build-passing.svg>> <<coverage-100.svg>> <<doc-90.svg>>

> import Data.Range

-}
module Data.Range.Types (
	Range(..), 
	RangeRelation(..)
	) 
where

  -- | The Range data type definition as a tuple that represents a interval in mathematics.
  --   - Range (a1, a2) define a closed interval where a2 > a1 and both are in the interval.
  --   - NegateRange (a1, a2) define a open interval where a2 > a1 and not are in the interval.
  --   - EmptyRange represent a Empty interval.
  data Range a 
    = EmptyRange                          -- ^ Empty Range
    | Range {-# UNPACK #-}! (a, a)        -- ^ Range (Closed interval)
    | NegateRange {-# UNPACK #-}! (a, a)  -- ^ Negation Range (Open interval)
    deriving (Eq, Ord, Show)

  --type Freq = Int
  --newtype FreqRanges n a = FreqRanges [n (Range a)] --deriving (Show, Eq) 

  -- | Type that characterizes the relationship between two ranges.
  data RangeRelation 
    = Equal            -- ^ Ranges are equal
    | AdjacentLeft     -- ^ Adjacent on the left
    | AdjacentRigth    -- ^ Adjacent on the rigth
    | Contain          -- ^ The range contains another range
    | Within           -- ^ The range is contained in another range
    | OverlapLeft      -- ^ Overlap on the left
    | OverlapRigth     -- ^ Overlap on the rigth
    | Separated        -- ^ The ranges are separated
    | NotDetermined    -- ^ The ranges relation is not determined
    deriving (Eq, Show)
  

