import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure SimplicialComplex where
  vertices : Type u
  faces : List (List vertices)
  closedUnderSubsets : Prop
  containsEmptyFace : Prop
  dimensionFinite : Prop

structure SimplicialComplexEvidence (K : SimplicialComplex) where
  closedUnderSubsetsClosed : K.closedUnderSubsets
  containsEmptyFaceClosed : K.containsEmptyFace
  dimensionFiniteClosed : K.dimensionFinite

def SimplicialComplexClosed (K : SimplicialComplex) : Prop :=
  K.closedUnderSubsets ∧ K.containsEmptyFace ∧ K.dimensionFinite

theorem simplicial_complex_closed_from_evidence (K : SimplicialComplex) (E : SimplicialComplexEvidence K) :
    SimplicialComplexClosed K := by
  exact And.intro E.closedUnderSubsetsClosed (And.intro E.containsEmptyFaceClosed E.dimensionFiniteClosed)

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse