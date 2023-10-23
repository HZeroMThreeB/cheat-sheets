#!/bin/bash

_ipfs_compgen() {
  local oldifs="$IFS"
  IFS=$'\n'
  while read -r line; do
    COMPREPLY+=("$line")
  done < <(compgen "$@")
  IFS="$oldifs"
}

_ipfs() {
  COMPREPLY=()
  local index=1
  local argidx=0
  local word="${COMP_WORDS[COMP_CWORD]}"
  
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-H \n-Q \n-n \n-p \n-q \n-r \n-t \n-w \n' -- "${word}"
_ipfs_compgen -S = -W $'-s\n' -- "${word}"
_ipfs_compgen -W $'--dereference-args \n--fscache \n--hidden \n--inline \n--nocopy \n--only-hash \n--pin \n--progress \n--quiet \n--quieter \n--raw-leaves \n--recursive \n--silent \n--trickle \n--wrap-with-directory \n' -- "${word}"
_ipfs_compgen -S = -W $'--chunker\n--cid-version\n--hash\n--ignore\n--ignore-rules-path\n--inline-limit\n--stdin-name\n--to-files\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"bitswap")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"ledger")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"reprovide")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--human \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"wantlist")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-p\n' -- "${word}"
_ipfs_compgen -S = -W $'--peer\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'ledger \nreprovide \nstat \nwantlist \n' -- "${word}"
fi

	    return 0
            ;;
    
	"block")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"put")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-f\n' -- "${word}"
_ipfs_compgen -W $'--allow-big-block \n--pin \n' -- "${word}"
_ipfs_compgen -S = -W $'--cid-codec\n--format\n--mhlen\n--mhtype\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-f \n-q \n' -- "${word}"
_ipfs_compgen -W $'--force \n--quiet \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'get \nput \nrm \nstat \n' -- "${word}"
fi

	    return 0
            ;;
    
	"bootstrap")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"default")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--default \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'default \n' -- "${word}"
fi

	    return 0
            ;;
    
	"list")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"all")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--all \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'all \n' -- "${word}"
fi

	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nlist \nrm \n' -- "${word}"
fi

	    return 0
            ;;
    
	"cat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -S = -W $'-l\n-o\n' -- "${word}"
_ipfs_compgen -W $'--progress \n' -- "${word}"
_ipfs_compgen -S = -W $'--length\n--offset\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"cid")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"base32")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"bases")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--numeric \n--prefix \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"codecs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-n \n-s \n' -- "${word}"
_ipfs_compgen -W $'--numeric \n--supported \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"format")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-b\n-f\n-v\n' -- "${word}"
_ipfs_compgen -S = -W $'--b\n--f\n--mc\n--v\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"hashes")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-n \n-s \n' -- "${word}"
_ipfs_compgen -W $'--numeric \n--supported \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'base32 \nbases \ncodecs \nformat \nhashes \n' -- "${word}"
fi

	    return 0
            ;;
    
	"commands")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"completion")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"bash")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"fish")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'bash \nfish \n' -- "${word}"
fi

	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-f \n' -- "${word}"
_ipfs_compgen -W $'--flags \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'completion \n' -- "${word}"
fi

	    return 0
            ;;
    
	"config")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"edit")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"profile")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"apply")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--dry-run \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'apply \n' -- "${word}"
fi

	    return 0
            ;;
    
	"replace")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"show")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--bool \n--json \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'edit \nprofile \nreplace \nshow \n' -- "${word}"
fi

	    return 0
            ;;
    
	"daemon")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--disable-transport-encryption \n--enable-gc \n--enable-mplex-experiment \n--enable-namesys-pubsub \n--enable-pubsub-experiment \n--init \n--manage-fdlimit \n--migrate \n--mount \n--unrestricted-api \n--writable \n' -- "${word}"
_ipfs_compgen -S = -W $'--agent-version-suffix\n--init-config\n--init-profile\n--mount-ipfs\n--mount-ipns\n--routing\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"dag")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"export")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -W $'--progress \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--output-codec\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"import")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--allow-big-block \n--pin-roots \n--silent \n--stats \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"put")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--allow-big-block \n--pin \n' -- "${word}"
_ipfs_compgen -S = -W $'--hash\n--input-codec\n--store-codec\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"resolve")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -W $'--progress \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'export \nget \nimport \nput \nresolve \nstat \n' -- "${word}"
fi

	    return 0
            ;;
    
	"dht")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"findpeer")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"findprovs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -S = -W $'-n\n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
_ipfs_compgen -S = -W $'--num-providers\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"provide")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n-v \n' -- "${word}"
_ipfs_compgen -W $'--recursive \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"put")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"query")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'findpeer \nfindprovs \nget \nprovide \nput \nquery \n' -- "${word}"
fi

	    return 0
            ;;
    
	"diag")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"cmds")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"clear")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"set-time")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'clear \nset-time \n' -- "${word}"
fi

	    return 0
            ;;
    
	"profile")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-o\n' -- "${word}"
_ipfs_compgen -S = -W $'--block-profile-rate\n--collectors\n--mutex-profile-fraction\n--output\n--profile-time\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"sys")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'cmds \nprofile \nsys \n' -- "${word}"
fi

	    return 0
            ;;
    
	"dns")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--recursive \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"file")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'ls \n' -- "${word}"
fi

	    return 0
            ;;
    
	"files")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"chcid")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--cid-version\n--hash\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"cp")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -W $'--parents \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"flush")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-U \n-l \n' -- "${word}"
_ipfs_compgen -W $'--U \n--long \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"mkdir")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -W $'--parents \n' -- "${word}"
_ipfs_compgen -S = -W $'--cid-version\n--hash\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"mv")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"read")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-n\n-o\n' -- "${word}"
_ipfs_compgen -S = -W $'--count\n--offset\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--force \n--recursive \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--hash \n--size \n--with-local \n' -- "${word}"
_ipfs_compgen -S = -W $'--format\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"write")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-e \n-p \n-t \n' -- "${word}"
_ipfs_compgen -S = -W $'-n\n-o\n' -- "${word}"
_ipfs_compgen -W $'--create \n--parents \n--raw-leaves \n--truncate \n' -- "${word}"
_ipfs_compgen -S = -W $'--cid-version\n--count\n--hash\n--offset\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-f \n' -- "${word}"
_ipfs_compgen -W $'--flush \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'chcid \ncp \nflush \nls \nmkdir \nmv \nread \nrm \nstat \nwrite \n' -- "${word}"
fi

	    return 0
            ;;
    
	"filestore")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"dups")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--file-order \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"verify")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--file-order \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'dups \nls \nverify \n' -- "${word}"
fi

	    return 0
            ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-C \n-a \n-p \n' -- "${word}"
_ipfs_compgen -S = -W $'-l\n-o\n' -- "${word}"
_ipfs_compgen -W $'--archive \n--compress \n--progress \n' -- "${word}"
_ipfs_compgen -S = -W $'--compression-level\n--output\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"id")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-f\n' -- "${word}"
_ipfs_compgen -S = -W $'--format\n--peerid-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"init")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-e \n' -- "${word}"
_ipfs_compgen -S = -W $'-a\n-b\n-p\n' -- "${word}"
_ipfs_compgen -W $'--empty-repo \n' -- "${word}"
_ipfs_compgen -S = -W $'--algorithm\n--bits\n--profile\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"key")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"export")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-f\n-o\n' -- "${word}"
_ipfs_compgen -S = -W $'--format\n--output\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"gen")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-s\n-t\n' -- "${word}"
_ipfs_compgen -S = -W $'--ipns-base\n--size\n--type\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"import")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-f\n' -- "${word}"
_ipfs_compgen -W $'--allow-any-key-type \n' -- "${word}"
_ipfs_compgen -S = -W $'--format\n--ipns-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"list")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-l \n' -- "${word}"
_ipfs_compgen -W $'--l \n' -- "${word}"
_ipfs_compgen -S = -W $'--ipns-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rename")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-f \n' -- "${word}"
_ipfs_compgen -W $'--force \n' -- "${word}"
_ipfs_compgen -S = -W $'--ipns-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-l \n' -- "${word}"
_ipfs_compgen -W $'--l \n' -- "${word}"
_ipfs_compgen -S = -W $'--ipns-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rotate")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-o\n-s\n-t\n' -- "${word}"
_ipfs_compgen -S = -W $'--oldkey\n--size\n--type\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'export \ngen \nimport \nlist \nrename \nrm \nrotate \n' -- "${word}"
fi

	    return 0
            ;;
    
	"log")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"level")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"tail")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'level \nls \ntail \n' -- "${word}"
fi

	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-s \n-v \n' -- "${word}"
_ipfs_compgen -W $'--headers \n--resolve-type \n--size \n--stream \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"mount")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-f\n-n\n' -- "${word}"
_ipfs_compgen -S = -W $'--ipfs-path\n--ipns-path\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"multibase")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"decode")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"encode")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-b\n' -- "${word}"
_ipfs_compgen -S = -W $'--b\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"list")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--numeric \n--prefix \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"transcode")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-b\n' -- "${word}"
_ipfs_compgen -S = -W $'--b\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'decode \nencode \nlist \ntranscode \n' -- "${word}"
fi

	    return 0
            ;;
    
	"name")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"inspect")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--verify\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"publish")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-Q \n' -- "${word}"
_ipfs_compgen -S = -W $'-k\n-t\n' -- "${word}"
_ipfs_compgen -W $'--allow-offline \n--quieter \n--resolve \n' -- "${word}"
_ipfs_compgen -S = -W $'--ipns-base\n--key\n--lifetime\n--ttl\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"pubsub")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"cancel")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"state")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"subs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--ipns-base\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'cancel \nstate \nsubs \n' -- "${word}"
fi

	    return 0
            ;;
    
	"resolve")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-n \n-r \n-s \n' -- "${word}"
_ipfs_compgen -W $'--nocache \n--recursive \n--stream \n' -- "${word}"
_ipfs_compgen -S = -W $'--dht-record-count\n--dht-timeout\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'inspect \npublish \npubsub \nresolve \n' -- "${word}"
fi

	    return 0
            ;;
    
	"object")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"data")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"diff")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--data-encoding\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"links")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--headers \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"new")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"patch")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add-link")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-p \n' -- "${word}"
_ipfs_compgen -W $'--create \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"append-data")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm-link")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"set-data")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--allow-big-block \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add-link \nappend-data \nrm-link \nset-data \n' -- "${word}"
fi

	    return 0
            ;;
    
	"put")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-q \n' -- "${word}"
_ipfs_compgen -W $'--pin \n--quiet \n' -- "${word}"
_ipfs_compgen -S = -W $'--datafieldenc\n--inputenc\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--human \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'data \ndiff \nget \nlinks \nnew \npatch \nput \nstat \n' -- "${word}"
fi

	    return 0
            ;;
    
	"p2p")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"close")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-a \n' -- "${word}"
_ipfs_compgen -S = -W $'-l\n-p\n-t\n' -- "${word}"
_ipfs_compgen -W $'--all \n' -- "${word}"
_ipfs_compgen -S = -W $'--listen-address\n--protocol\n--target-address\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"forward")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--allow-custom-protocol \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"listen")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--allow-custom-protocol \n--report-peer-id \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--headers \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stream")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"close")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-a \n' -- "${word}"
_ipfs_compgen -W $'--all \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--headers \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'close \nls \n' -- "${word}"
fi

	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'close \nforward \nlisten \nls \nstream \n' -- "${word}"
fi

	    return 0
            ;;
    
	"pin")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--progress \n--recursive \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-q \n-s \n' -- "${word}"
_ipfs_compgen -S = -W $'-t\n' -- "${word}"
_ipfs_compgen -W $'--quiet \n--stream \n' -- "${word}"
_ipfs_compgen -S = -W $'--type\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"remote")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--background \n' -- "${word}"
_ipfs_compgen -S = -W $'--name\n--service\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'--cid\n--name\n--service\n--status\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--force \n' -- "${word}"
_ipfs_compgen -S = -W $'--cid\n--name\n--service\n--status\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"service")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--stat \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nls \nrm \n' -- "${word}"
fi

	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nls \nrm \nservice \n' -- "${word}"
fi

	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--recursive \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"update")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--unpin \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"verify")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-q \n' -- "${word}"
_ipfs_compgen -W $'--quiet \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nls \nremote \nrm \nupdate \nverify \n' -- "${word}"
fi

	    return 0
            ;;
    
	"ping")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-n\n' -- "${word}"
_ipfs_compgen -S = -W $'--count\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"pubsub")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"peers")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"pub")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"sub")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'ls \npeers \npub \nsub \n' -- "${word}"
fi

	    return 0
            ;;
    
	"refs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"local")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-e \n-r \n-u \n' -- "${word}"
_ipfs_compgen -W $'--edges \n--recursive \n--unique \n' -- "${word}"
_ipfs_compgen -S = -W $'--format\n--max-depth\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'local \n' -- "${word}"
fi

	    return 0
            ;;
    
	"repo")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"fsck")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"gc")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-q \n' -- "${word}"
_ipfs_compgen -W $'--quiet \n--silent \n--stream-errors \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"migrate")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--allow-downgrade \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-H \n-s \n' -- "${word}"
_ipfs_compgen -W $'--human \n--size-only \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"verify")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"version")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-q \n' -- "${word}"
_ipfs_compgen -W $'--quiet \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'fsck \ngc \nls \nmigrate \nstat \nverify \nversion \n' -- "${word}"
fi

	    return 0
            ;;
    
	"resolve")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n' -- "${word}"
_ipfs_compgen -W $'--recursive \n' -- "${word}"
_ipfs_compgen -S = -W $'--dht-record-count\n--dht-timeout\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"routing")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"findpeer")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"findprovs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -S = -W $'-n\n' -- "${word}"
_ipfs_compgen -W $'--verbose \n' -- "${word}"
_ipfs_compgen -S = -W $'--num-providers\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"get")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"provide")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-r \n-v \n' -- "${word}"
_ipfs_compgen -W $'--recursive \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"put")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'findpeer \nfindprovs \nget \nprovide \nput \n' -- "${word}"
fi

	    return 0
            ;;
    
	"shutdown")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"stats")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"bitswap")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--human \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"bw")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -S = -W $'-i\n-p\n-t\n' -- "${word}"
_ipfs_compgen -W $'--poll \n' -- "${word}"
_ipfs_compgen -S = -W $'--interval\n--peer\n--proto\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"dht")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"provide")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"repo")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-H \n-s \n' -- "${word}"
_ipfs_compgen -W $'--human \n--size-only \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'bitswap \nbw \ndht \nprovide \nrepo \n' -- "${word}"
fi

	    return 0
            ;;
    
	"swarm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"addrs")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"listen")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"local")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'--id \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'listen \nlocal \n' -- "${word}"
fi

	    return 0
            ;;
    
	"connect")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"disconnect")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"filters")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nrm \n' -- "${word}"
fi

	    return 0
            ;;
    
	"peering")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"ls")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"rm")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nls \nrm \n' -- "${word}"
fi

	    return 0
            ;;
    
	"peers")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-v \n' -- "${word}"
_ipfs_compgen -W $'--direction \n--identify \n--latency \n--streams \n--verbose \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"resources")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'addrs \nconnect \ndisconnect \nfilters \npeering \npeers \nresources \n' -- "${word}"
fi

	    return 0
            ;;
    
	"tar")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"cat")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \ncat \n' -- "${word}"
fi

	    return 0
            ;;
    
	"update")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
	"urlstore")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"add")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-t \n' -- "${word}"
_ipfs_compgen -W $'--pin \n--trickle \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \n' -- "${word}"
fi

	    return 0
            ;;
    
	"version")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
	"deps")
	    let index++
	    
while [[ ${index} -lt ${COMP_CWORD} ]]; do
    case "${COMP_WORDS[index]}" in
        -*)
	    let index++
            continue
	    ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-n \n' -- "${word}"
_ipfs_compgen -W $'--all \n--commit \n--number \n--repo \n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'deps \n' -- "${word}"
fi

	    return 0
            ;;
    
    esac
    break
done

if [[ "${word}" == -* ]]; then
_ipfs_compgen -W $'-D \n-L \n-h \n' -- "${word}"
_ipfs_compgen -S = -W $'-c\n' -- "${word}"
_ipfs_compgen -W $'--debug \n--h \n--help \n--local \n--offline \n--stream-channels \n--upgrade-cidv0-in-output \n' -- "${word}"
_ipfs_compgen -S = -W $'--api\n--cid-base\n--config\n--config-file\n--encoding\n--repo-dir\n--timeout\n' -- "${word}"
return 0
fi

while [[ ${index} -lt ${COMP_CWORD} ]]; do
    if [[ "${COMP_WORDS[index]}" != -* ]]; then
        let argidx++
    fi
    let index++
done
if [[ "${argidx}" -eq 0 ]]; then
    _ipfs_compgen -W $'add \nbitswap \nblock \nbootstrap \ncat \ncid \ncommands \nconfig \ndaemon \ndag \ndht \ndiag \ndns \nfile \nfiles \nfilestore \nget \nid \ninit \nkey \nlog \nls \nmount \nmultibase \nname \nobject \np2p \npin \nping \npubsub \nrefs \nrepo \nresolve \nrouting \nshutdown \nstats \nswarm \ntar \nupdate \nurlstore \nversion \n' -- "${word}"
fi

}
complete -o nosort -o nospace -o default -F _ipfs ipfs
