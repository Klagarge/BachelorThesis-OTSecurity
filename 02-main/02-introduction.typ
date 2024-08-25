// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
}
// END OF HEADER

#todo[
  L'introduction sert à présenter le sujet de votre mémoire de bachelor et à éveiller la curiosité du lecteur par une vue d'ensemble. Nous expliquons ici pourquoi elle est importante et comment elle est structurée.
  Vous pouvez considérer l'introduction comme une accroche pour votre mémoire de licence. Vous éveillez l'intérêt et donnez un avant-goût en présentant votre motivation, votre méthode et l'état de la recherche dans votre introduction.


  Dès l'introduction, convainquez vos examinateurs que votre mémoire de licence sera passionnant. Si votre professeur commence à lire votre mémoire avec impatience et intérêt, les chances d'obtenir de bonnes notes sont plus élevées.
  Accordez une attention particulière aux éléments suivants dans votre introduction :
  - Introduire le sujet - Qu'est-ce qui caractérise le sujet ?
  - Introduire l'objectif - Que voulez-vous atteindre avec votre thèse ?
  - Susciter la curiosité du lecteur - Qu'est-ce qui motive le lecteur à poursuivre sa lecture ?
  - Décrire la pertinence - Pourquoi ce mémoire de licence est-il scientifiquement pertinent ? 
  
  L'introduction doit contenir les éléments suivants :
  - *Présentation initiale du sujet* - Vous introduisez le sujet par un "appât" passionnant. Vous fournissez des informations initiales sur le sujet et l'objet de la recherche et expliquez l'état actuel de la recherche.
  - *Pertinence de la motivation du sujet* - Vous justifiez la pertinence de votre sujet (d'un point de vue scientifique) et le placez dans le contexte de votre domaine. En outre, il est souvent demandé que vous divulguiez votre motivation personnelle.
  - *Description du problème et délimitation thématique* - Au moyen d'une question de recherche spécifique (ou d'une hypothèse), vous présentez votre intérêt de recherche explicite. Si nécessaire, expliquez les termes techniques.
  - *Objectifs* - Votre introduction doit clairement indiquer l'objectif de votre travail et le résultat que vous espérez obtenir à l'issue de la rédaction de votre mémoire de licence.
  - *Méthode* - Vous expliquez l'approche et justifiez le choix de la méthode. 
  - *Structure du mémoire de bachelor* - Enfin, vous donnez au lecteur un aperçu général de votre mémoire de bachelor en expliquant la structure, en montrant le fil rouge et en expliquant comment la question de recherche est résolue.
]