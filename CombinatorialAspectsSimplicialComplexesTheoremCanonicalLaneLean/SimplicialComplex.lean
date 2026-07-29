import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure SimplicialComplex where
  vertices : Type u
  faces : List (List vertices)
  closedUnderSubsets : Prop
  finite : Prop

structure SimplicialComplexEvidence (K : SimplicialComplex) where
  closedUnderSubsetsClosed : K.closedUnderSubsets
  finiteClosed : K.finite

def SimplicialComplexClosed (K : SimplicialComplex) : Prop :=
  K.closedUnderSubsets ∧ K.finite

theorem simplicial_complex_closed_from_evidence (K : SimplicialComplex) (E : SimplicialComplexEvidence K) : SimplicialComplexClosed K := by
  exact And.intro E.closedUnderSubsetsClosed E.finiteClosed

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse