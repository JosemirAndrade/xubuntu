#!/bin/bash
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches

# sync : Vai sincronizar e liberar o buffer do sistema de arquivos, permitindo que você possa limpá-lo sem riscos de corromper nada.
# ; : Executará o comando somente quando o anterior terminar. Somente após a sincronia, o buff poderá ser apagado sem corromper arquivos do sistema.
# Escrever 1, 2 ou 3 no arquivo drop_cache vai limpar o cache sem matar nenhum programa, processo ou serviço do sistema.
