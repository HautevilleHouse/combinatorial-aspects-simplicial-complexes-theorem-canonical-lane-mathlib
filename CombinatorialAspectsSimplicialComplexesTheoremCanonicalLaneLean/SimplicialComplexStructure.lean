import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean

structure SimplicialComplexPackage where
  vertexSet : Type u
  simplexSet : Type v
  faceInclusion : Prop
  boundaryOperator : Type w
  homologyGroups : Type x
  finiteComplex : Prop
  pureComplex : Prop
  skeletonFiltration : Prop

structure SimplicialComplexEvidence (S : SimplicialComplexPackage) where
  faceInclusionClosed : S.faceInclusion
  boundaryOperatorDefined : Nonempty S.boundaryOperator
  finiteComplexClosed : S.finiteComplex
  pureComplexClosed : S.pureComplex
  skeletonFiltrationClosed : S.skeletonFiltration

def SimplicialComplexClosed (S : SimplicialComplexPackage) : Prop :=
  S.faceInclusion ∧ S.finiteComplex ∧ S.pureComplex ∧ S.skeletonFiltration

theorem simplicial_complex_closed_from_evidence
    (S : SimplicialComplexPackage) (E : SimplicialComplexEvidence S) :
    SimplicialComplexClosed S := by
  exact And.intro E.faceInclusionClosed
    (And.intro E.finiteComplexClosed
      (And.intro E.pureComplexClosed E.skeletonFiltrationClosed))

end CombinatorialAspectsSimplicialComplexesTheoremCanonicalLaneLean
end HautevilleHouse
