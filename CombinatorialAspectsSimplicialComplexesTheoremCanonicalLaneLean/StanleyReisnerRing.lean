import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean.SimplicialComplex

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure StanleyReisnerRingPackage (K : SimplicialComplex) where
  polynomialRing : Type u
  stanleyReisnerIdeal : Set (polynomialRing)
  quotient : Type u
  hilbertSeries : ℕ → ℕ

structure StanleyReisnerRingEvidence {K : SimplicialComplex} (S : StanleyReisnerRingPackage K) where
  idealGeneratedByNonFaces : S.stanleyReisnerIdeal = { f : S.polynomialRing | ∀ σ ⊆ K.vertices, σ ∉ K.faces → f evaluated at σ = 0 }
  quotientIsGraded : S.quotient ≃ S.polynomialRing / S.stanleyReisnerIdeal
  hilbertSeriesMatches : ∀ d, S.hilbertSeries d = Nat.dim (gradedComponent d) (S.quotient)

def StanleyReisnerRingClosed {K : SimplicialComplex} (S : StanleyReisnerRingPackage K) : Prop :=
  S.stanleyReisnerIdeal = { f : S.polynomialRing | ∀ σ ⊆ K.vertices, σ ∉ K.faces → f evaluated at σ = 0 } ∧
  S.quotient ≃ S.polynomialRing / S.stanleyReisnerIdeal ∧
  (∀ d, S.hilbertSeries d = Nat.dim (gradedComponent d) (S.quotient))

theorem stanley_reisner_ring_closed_from_evidence {K : SimplicialComplex} (S : StanleyReisnerRingPackage K) (E : StanleyReisnerRingEvidence S) : StanleyReisnerRingClosed S := by
  exact And.intro E.idealGeneratedByNonFaces (And.intro E.quotientIsGraded E.hilbertSeriesMatches)

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse