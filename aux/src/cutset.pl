/*
    The contents of this file are subject to the Mozilla Public License
    Version  1.1  (the "License"); you may not use this file except in
    compliance with the License. You may obtain a copy of the License at:

    http://www.mozilla.org/MPL/

    Software  distributed  under  the License is distributed on an "AS
    IS"  basis,  WITHOUT  WARRANTY  OF  ANY  KIND,  either  express or
    implied.  See  the  License  for  the  specific language governing
    rights and limitations under the License.
    The Original Code is the contents of this file.
    The  Initial  Developer  of  the  Original  Code is SICS, Swedish
    Institute of Computer Science AB (SICS).
    Portions  created  by the Initial Developer are Copyright (C) 2007
    of the Initial Developer. All Rights Reserved.
    Contributor(s):
    _____Mats Carlsson <matsc@sics.se>
    _____Nicolas Beldiceanu <Nicolas.Beldiceanu@emn.fr>

    Alternatively, if the contents of this file is included as a part of
    SICStus Prolog distribution by SICS, it may be used under the terms of
    an appropriate SICStus Prolog License Agreement (the "SICStus Prolog
    License"), in which case the provisions of the SICStus Prolog License
    are applicable instead of those above.
*/

:- multifile
    ctr_predefined/1,
    ctr_date/2,
    ctr_persons/2,
    ctr_origin/3,
    ctr_usual_name/2,
    ctr_synonyms/2,
    ctr_types/2,
    ctr_arguments/2,
    ctr_exchangeable/2,
    ctr_restrictions/2,
    ctr_typical/2,
    ctr_pure_functional_dependency/2,
    ctr_functional_dependency/3,
    ctr_contractible/4,
    ctr_extensible/4,
    ctr_aggregate/3,
    ctr_example/2,
    ctr_draw_example/9,
    ctr_cond_imply/5,
    ctr_see_also/2,
    ctr_key_words/2,
    ctr_derived_collections/2,
    ctr_graph/7,
    ctr_graph/9,
    ctr_eval/2,
    ctr_sol/6,
    ctr_logic/3,
    ctr_application/2.

ctr_date(cutset,['20030820','20040530','20060807']).

ctr_origin(cutset, '\\cite{FagesLal03}', []).

ctr_arguments(cutset,
              ['SIZE_CUTSET'-dvar                                 ,
               'NODES'-collection(index-int, succ-sint, bool-dvar)]).

ctr_exchangeable(cutset,
                 [items('NODES',all)]).

ctr_restrictions(cutset,
                 ['SIZE_CUTSET' >= 0                 ,
                  'SIZE_CUTSET' =< size('NODES')     ,
                  required('NODES',[index,succ,bool]),
                  'NODES'^index >= 1                 ,
                  'NODES'^index =< size('NODES')     ,
                  distinct('NODES',index)            ,
                  'NODES'^bool >= 0                  ,
                  'NODES'^bool =< 1                  ]).

ctr_typical(cutset,
            ['SIZE_CUTSET' >  0            ,
             'SIZE_CUTSET' =< size('NODES'),
             size('NODES') >  1            ]).

ctr_graph(cutset,
          ['NODES'],
          2,
          ['CLIQUE'>>collection(nodes1,nodes2)],
          [in_set(nodes2^index,nodes1^succ),
           nodes1^bool = 1                 ,
           nodes2^bool = 1                 ],
          ['MAX_NSCC' =< 1                            ,
           'NVERTEX'  =  size('NODES') - 'SIZE_CUTSET'],
          ['ACYCLIC', 'NO_LOOP']).

ctr_example(cutset,
            cutset(1,
                   [[index-1, succ-{2,3,4}, bool-1],
                    [index-2, succ-{3},     bool-1],
                    [index-3, succ-{4},     bool-1],
                    [index-4, succ-{1},     bool-0]])).

ctr_draw_example(cutset,
                 ['NODES'],
                 [[[[index-1, succ-{2,3,4}],
                    [index-2, succ-{3}    ],
                    [index-3, succ-{4}    ],
                    [index-4, succ-{1}    ]]],
                  [[[index-1, succ-{2,3,4}, bool-1],
                    [index-2, succ-{3},     bool-1],
                    [index-3, succ-{4},     bool-1],
                    [index-4, succ-{1},     bool-0]]]],
                 ['CLIQUE'],
                 [[1-[2,3,4],2-[3],3-[4],4-[1]],
                  [1-[2,3],2-3]],
                 [['COLLECTIONS'(['NODES'-[1,2,3,4]])],
                  ['NVERTEX']],
                 '','MAX_NSCC=1,NVERTEX=3',
                 [2.145,2.145,2.145,1.6]).

ctr_key_words(cutset,['graph constraint'           ,
                      'circuit'                    ,
                      'directed acyclic graph'     ,
                      'acyclic'                    ,
                      'no loop'                    ,
                      'deadlock breaking'          ,
                      'program verification'       ,
                      'minimum feedback vertex set']).

ctr_persons(cutset,['Fages F.'   ,
                    'Lal A.'     ,
                    'Levy H.'    ,
                    'Low D. W.'  ,
                    'Lloyd E. L.',
                    'Soffa M. L.',
                    'Wang C. C.' ]).